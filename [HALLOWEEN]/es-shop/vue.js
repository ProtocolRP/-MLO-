const app = new Vue({
  el: '#app',
  data: {
    ui: false,
    isLoading: false,
    loadingText: 'Loading Shop Data...',
    playerBalance: 15420,
    playerBankBalance: 25000,
    selectedCategory: 'All',
    searchQuery: '',
    selectedItem: null,
    showCart: false,
    cartItems: [],
    categories: [],
    shopName: 'SHOP',
    shopItems: [],
    // Modern notification system with queue management
    notificationQueue: [],
    isShowingNotification: false,
    currentNotification: null,
    // Payment method system
    showPaymentDropdown: false,
    selectedPaymentMethod: 'cash' // 'cash' or 'bank'
  },
  computed: {
    filteredItems() {
      console.log('filteredItems computed called');
      console.log('searchQuery:', this.searchQuery);
      console.log('selectedCategory:', this.selectedCategory);
      
      if (!this.shopItems || this.shopItems.length === 0) {
        return [];
      }
      
      let items = [...this.shopItems]; // Create a copy
      
      // Category filter
      if (this.selectedCategory && this.selectedCategory !== 'All') {
        items = items.filter(item => item.category === this.selectedCategory);
      }
      
      // Search filter
      const query = this.searchQuery || '';
      if (query.trim() !== '') {
        const searchTerm = query.toLowerCase().trim();
        console.log('Searching for:', searchTerm);
        items = items.filter(item => 
          (item.name && item.name.toLowerCase().includes(searchTerm)) ||
          (item.type && item.type.toLowerCase().includes(searchTerm)) ||
          (item.category && item.category.toLowerCase().includes(searchTerm)) ||
          (item.rarity && item.rarity.toLowerCase().includes(searchTerm)) ||
          (item.description && item.description.toLowerCase().includes(searchTerm))
        );
      }
      
      console.log('Filtered items result:', items.length);
      return items;
    },
    cartTotal() {
      return this.cartItems.reduce((total, item) => {
        return total + (item.price * item.quantity);
      }, 0);
    }
  },
  watch: {
    searchQuery: {
      handler(newVal, oldVal) {
        console.log('Watch: searchQuery changed from "' + oldVal + '" to "' + newVal + '"');
      },
      immediate: true
    }
  },
  methods: {
    toggleUI() {
      this.ui = !this.ui;
    },
    selectItem(item) {
      this.selectedItem = item;
    },
    
    // Search Methods
    clearSearch() {
      console.log('clearSearch called');
      this.searchQuery = '';
      this.$forceUpdate();
    },
    
    onSearchInput(event) {
      console.log('Search input changed:', this.searchQuery);
      console.log('Event target value:', event?.target?.value);
      console.log('Filtered items count:', this.filteredItems.length);
      
      // Force reactivity update
      this.$forceUpdate();
      
      // Auto-select first item after search if items are available
      this.$nextTick(() => {
        if (this.filteredItems.length > 0) {
          this.selectedItem = this.filteredItems[0];
        } else {
          this.selectedItem = null;
        }
      });
    },
    
    // Cart Methods
    toggleCart() {
      this.showCart = !this.showCart;
    },
    closeCart() {
      // Add closing animation classes
      const cartOverlay = document.querySelector('.cart-overlay');
      const cartPanel = document.querySelector('.cart-panel');
      
      if (cartOverlay) cartOverlay.classList.add('closing');
      if (cartPanel) cartPanel.classList.add('closing');
      
      // Close after animation completes
      setTimeout(() => {
        this.showCart = false;
      }, 300); // Match animation duration
    },
    closeShop() {
      // Add closing animation class
      const shopContainer = document.querySelector('.shop-container');
      if (shopContainer) {
        shopContainer.classList.add('closing');
      }
      
      // Close after animation completes
      setTimeout(() => {
        this.ui = false;
        this.showCart = false;
        this.selectedItem = null;
        this.searchQuery = '';
        this.selectedCategory = 'All';
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
      }, 250); // Match animation duration
    },
    addToCart(item) {
      const existingItem = this.cartItems.find(cartItem => cartItem.id === item.id);
      
      if (existingItem) {
        existingItem.quantity += 1;
      } else {
        this.cartItems.push({
          ...item,
          quantity: 1
        });
      }
      
      console.log(`${item.name} added to cart!`);
      this.showNotification(`${item.name} added to cart!`, 'success', 2000);
    },
    removeFromCart(item) {
      const index = this.cartItems.findIndex(cartItem => cartItem.id === item.id);
      if (index !== -1) {
        this.cartItems.splice(index, 1);
      }
    },
    increaseQuantity(cartItem) {
      cartItem.quantity += 1;
    },
    decreaseQuantity(cartItem) {
      if (cartItem.quantity > 1) {
        cartItem.quantity -= 1;
      } else {
        this.removeFromCart(cartItem);
      }
    },
    isInCart(item) {
      return this.cartItems.some(cartItem => cartItem.id === item.id);
    },
    clearCart() {
      this.cartItems = [];
      console.log('Sepet temizlendi!');
    },
    buyItem() {
      if (this.selectedItem && this.playerBalance >= this.selectedItem.price) {
        // FiveM entegrasyonu ile satın alma (progress bar client.lua'da hallediliyor)
        $.post(`https://${GetParentResourceName()}/buyItem`, JSON.stringify({
          id: this.selectedItem.id,
          quantity: 1
        }), (response) => {
          if (response.success) {
            // Başarılı satın alma
            console.log('Item purchased successfully!', response.message);
            
            // Seçili item'i temizle
            this.selectedItem = null;
            
            // Show success notification
            this.showNotification('Item purchased successfully!', 'success');
          } else {
            // Hatalı satın alma
            console.log('Purchase failed:', response.message);
            this.showNotification(response.message || 'Purchase failed!', 'error');
          }
        }).fail(() => {
          this.showNotification('Connection error!', 'error');
        });
      } else {
        this.showNotification('Insufficient balance!', 'error');
      }
    },
    togglePaymentDropdown() {
      if (this.showPaymentDropdown) {
        // If dropdown is open, proceed with purchase
        this.buyAllItems();
      } else {
        // If dropdown is closed, open it
        this.showPaymentDropdown = true;
      }
    },
    
    selectPaymentMethod(method) {
      this.selectedPaymentMethod = method;
      this.showPaymentDropdown = false;
      // Immediately proceed with purchase after selection
      this.buyAllItems();
    },
    
    buyAllItems() {
      const currentBalance = this.selectedPaymentMethod === 'cash' ? this.playerBalance : this.playerBankBalance;
      
      if (currentBalance >= this.cartTotal && this.cartItems.length > 0) {
        // Close dropdown
        this.showPaymentDropdown = false;
        
        // Prepare cart data for debugging
        const cartData = {
          items: this.cartItems.map(item => ({
            id: item.id,
            quantity: item.quantity
          })),
          paymentMethod: this.selectedPaymentMethod
        };
        
        console.log('[CART] Sending cart data:', cartData);
        console.log('[CART] Payment method:', this.selectedPaymentMethod);
        console.log('[CART] Cart total:', this.cartTotal);
        console.log('[CART] Current balance:', currentBalance);
        
        // FiveM entegrasyonu ile sepet satın alma (payment method ile birlikte)
        $.post(`https://${GetParentResourceName()}/buyCart`, JSON.stringify(cartData), (response) => {
          console.log('[CART] Server response:', response);
          
          if (response.success) {
            // Başarılı satın alma
            console.log('Cart purchased successfully!', response.message);
            
            // Sepeti temizle
            this.cartItems = [];
            this.showCart = false;
            
            // Show success notification
            if (response.result && response.result.failedItems && response.result.failedItems.length > 0) {
              this.showNotification(`${response.result.successCount} items purchased via ${this.selectedPaymentMethod.toUpperCase()}. Some items failed.`, 'warning');
            } else {
              this.showNotification(`All items purchased successfully via ${this.selectedPaymentMethod.toUpperCase()}!`, 'success');
            }
          } else {
            // Hatalı satın alma
            console.log('Cart purchase failed:', response.message);
            this.showNotification(response.message || 'Cart purchase failed!', 'error');
          }
        }).fail((xhr, status, error) => {
          console.log('[CART] Request failed:', status, error);
          this.showNotification('Connection error!', 'error');
        });
      } else {
        if (this.cartItems.length === 0) {
          this.showNotification('Cart is empty!', 'error');
        } else {
          this.showNotification(`Insufficient ${this.selectedPaymentMethod} balance!`, 'error');
        }
      }
    },
    // Level icon system
    getLevelIcon(level) {
      if (!level) return { icon: 'fas fa-user', class: 'level-1-9' };
      
      if (level >= 1 && level <= 9) {
        return { icon: 'fas fa-user', class: 'level-1-9' }; // Recruit
      } else if (level >= 10 && level <= 19) {
        return { icon: 'fas fa-shield', class: 'level-10-19' }; // Specialist
      } else if (level >= 20 && level <= 29) {
        return { icon: 'fas fa-star', class: 'level-20-29' }; // Elite
      } else if (level >= 30 && level <= 39) {
        return { icon: 'fas fa-crown', class: 'level-30-39' }; // Veteran
      } else if (level >= 40 && level <= 49) {
        return { icon: 'fas fa-fire', class: 'level-40-49' }; // Expert
      } else if (level >= 50 && level <= 59) {
        return { icon: 'fas fa-trophy', class: 'level-50-59' }; // Master
      } else if (level >= 60) {
        return { icon: 'fas fa-dragon', class: 'level-60-99' }; // Legend
      }
      
      return { icon: 'fas fa-user', class: 'level-1-9' };
    },
    
    getLevelTitle(level) {
      if (!level) return 'Recruit';
      
      if (level >= 1 && level <= 9) return 'Recruit';
      else if (level >= 10 && level <= 19) return 'Specialist';
      else if (level >= 20 && level <= 29) return 'Elite Agent';
      else if (level >= 30 && level <= 39) return 'Veteran';
      else if (level >= 40 && level <= 49) return 'Expert';
      else if (level >= 50 && level <= 59) return 'Master';
      else if (level >= 60) return 'Legend';
      
      return 'Recruit';
    },
    
    // Modern loading methods
    showLoading(text = 'Loading...') {
      this.isLoading = true;
      this.loadingText = text;
    },
    
    hideLoading() {
      // Hide loading after a short delay for smooth transition
      setTimeout(() => {
        this.isLoading = false;
      }, 200);
    },
    
    // Enhanced methods with loading
    selectItem(item) {
      this.selectedItem = item;
    },
    
    // Enhanced attribute visualization methods with category-based icons
    getAttributeIcon(attributeName) {
      // Yemek ve İçecek İconları
      const foodIcons = {
        'Hunger': 'fas fa-utensils',
        'Protein': 'fas fa-drumstick-bite',
        'Health': 'fas fa-heart',
        'Thirst': 'fas fa-tint',
        'Stamina': 'fas fa-running',
        'Speed': 'fas fa-bolt',
        'Energy': 'fas fa-battery-full',
        'Pain Relief': 'fas fa-pills',
        'Duration': 'fas fa-clock',
        'Healing Speed': 'fas fa-medkit'
      };
      
      // Silah İconları
      const weaponIcons = {
        'Critical Hit Damage': 'fas fa-bullseye',
        'Critical Hit Chance': 'fas fa-crosshairs',
        'Headshot Damage': 'fas fa-skull-crossbones',
        'Damage to Elites': 'fas fa-star',
        'Weapon Damage': 'fas fa-bomb',
        'Assault Rifle Damage': 'fas fa-crosshairs',
        'Rate of Fire': 'fas fa-tachometer-alt',
        'Fire Rate': 'fas fa-tachometer-alt',
        'Accuracy': 'fas fa-eye',
        'Range': 'fas fa-expand-arrows-alt',
        'Damage': 'fas fa-fire',
        'Pellets': 'fas fa-circle'
      };
      
      // Araç/Tool İconları
      const toolIcons = {
        'Armor Regeneration': 'fas fa-shield-alt',
        'Skill Damage': 'fas fa-magic',
        'Skill Haste': 'fas fa-bolt',
        'Explosive Damage': 'fas fa-bomb',
        'Status Effects': 'fas fa-flask',
        'Instant Armor Repair': 'fas fa-tools',
        'Blast Radius': 'fas fa-expand-arrows-alt',
        'Bleed Effect': 'fas fa-tint',
        'Skill Power': 'fas fa-cog',
        'Repair': 'fas fa-wrench',
        'Uses': 'fas fa-redo',
        'Size Range': 'fas fa-ruler',
        'Material': 'fas fa-cube',
        'Type': 'fas fa-tag',
        'Capacity': 'fas fa-weight-hanging'
      };
      
      // Surveillance/Detection İconları
      const detectionIcons = {
        'Detection Depth': 'fas fa-search',
        'Sensitivity': 'fas fa-adjust',
        'Audio Alert': 'fas fa-volume-up',
        'Visibility': 'fas fa-eye',
        'Night Vision': 'fas fa-moon'
      };
      
      // Ammo/Weapon Mod İconları
      const ammoIcons = {
        'Quantity': 'fas fa-boxes',
        'Reload Time': 'fas fa-sync-alt'
      };
      
      // Önce spesifik kategorilere bak
      if (foodIcons[attributeName]) return foodIcons[attributeName];
      if (weaponIcons[attributeName]) return weaponIcons[attributeName];
      if (toolIcons[attributeName]) return toolIcons[attributeName];
      if (detectionIcons[attributeName]) return detectionIcons[attributeName];
      if (ammoIcons[attributeName]) return ammoIcons[attributeName];
      
      // Fallback
      return 'fas fa-plus-circle';
    },
    
    getAttributeColor(attributeName) {
      // Yemek ve Sağlık Renkleri (Yeşil/Mavi tonları)
      const foodColors = {
        'Hunger': '#4caf50',
        'Protein': '#8bc34a', 
        'Health': '#f44336',
        'Thirst': '#2196f3',
        'Stamina': '#ff9800',
        'Speed': '#ffeb3b',
        'Energy': '#cddc39',
        'Pain Relief': '#9c27b0',
        'Duration': '#607d8b',
        'Healing Speed': '#4caf50'
      };
      
      // Silah Renkleri (Kırmızı/Turuncu tonları)
      const weaponColors = {
        'Critical Hit Damage': '#ff6900',
        'Critical Hit Chance': '#ff6900', 
        'Headshot Damage': '#ff0040',
        'Damage to Elites': '#ffcc00',
        'Weapon Damage': '#ff6900',
        'Assault Rifle Damage': '#ff6900',
        'Rate of Fire': '#ff9800',
        'Fire Rate': '#ff9800',
        'Accuracy': '#2196f3',
        'Range': '#9c27b0',
        'Damage': '#ff5722',
        'Pellets': '#ff9800'
      };
      
      // Araç/Tool Renkleri (Mavi/Mor tonları)
      const toolColors = {
        'Armor Regeneration': '#00ff41',
        'Skill Damage': '#9c27b0',
        'Skill Haste': '#9c27b0',
        'Explosive Damage': '#ff0040',
        'Status Effects': '#ffcc00',
        'Instant Armor Repair': '#00ff41',
        'Blast Radius': '#ff0040',
        'Bleed Effect': '#ff0040',
        'Skill Power': '#9c27b0',
        'Repair': '#00ff41',
        'Uses': '#607d8b',
        'Size Range': '#795548',
        'Material': '#607d8b',
        'Type': '#9e9e9e',
        'Capacity': '#3f51b5'
      };
      
      // Detection Renkleri (Cyan/Teal tonları)
      const detectionColors = {
        'Detection Depth': '#00bcd4',
        'Sensitivity': '#009688',
        'Audio Alert': '#ff9800',
        'Visibility': '#2196f3',
        'Night Vision': '#673ab7'
      };
      
      // Ammo Renkleri
      const ammoColors = {
        'Quantity': '#795548',
        'Reload Time': '#ff9800'
      };
      
      // Önce spesifik kategorilere bak
      if (foodColors[attributeName]) return foodColors[attributeName];
      if (weaponColors[attributeName]) return weaponColors[attributeName];
      if (toolColors[attributeName]) return toolColors[attributeName];
      if (detectionColors[attributeName]) return detectionColors[attributeName];
      if (ammoColors[attributeName]) return ammoColors[attributeName];
      
      // Fallback
      return '#ffffff';
    },
    getAttributePercentage(value) {
      // Extract percentage from value string
      const match = value.match(/[\d.]+/);
      return match ? Math.round(parseFloat(match[0])) + '%' : value;
    },
    getProgressDashArray(value) {
      const circumference = 2 * Math.PI * 28; // radius = 28
      return circumference;
    },
    getProgressOffset(value) {
      const circumference = 2 * Math.PI * 28;
      const match = value.match(/[\d.]+/);
      let percentage = 0;
      
      if (match) {
        let numValue = parseFloat(match[0]);
        // Different scaling for different types of values
        if (value.includes('%')) {
          percentage = Math.min(numValue, 100);
        } else if (numValue > 100) {
          // For values like 185.0% headshot damage, scale differently
          percentage = Math.min((numValue / 200) * 100, 100);
        } else {
          percentage = Math.min(numValue, 100);
        }
      }
      
      const offset = circumference - (percentage / 100) * circumference;
      return offset;
    },
    
    // Category filter scroll handling
    setupCategoryScrollHandling() {
      const categoryFilter = document.querySelector('.category-filter');
      if (!categoryFilter) return;
      
      const updateScrollClasses = () => {
        const scrollLeft = categoryFilter.scrollLeft;
        const scrollWidth = categoryFilter.scrollWidth;
        const clientWidth = categoryFilter.clientWidth;
        const maxScroll = scrollWidth - clientWidth;
        
        // Remove existing classes
        categoryFilter.classList.remove('scrolled-left', 'scrolled-right');
        
        // Add classes based on scroll position
        if (scrollLeft > 10) {
          categoryFilter.classList.add('scrolled-left');
        }
        
        if (scrollLeft >= maxScroll - 10) {
          categoryFilter.classList.add('scrolled-right');
        }
      };
      
      // Add scroll event listener
      categoryFilter.addEventListener('scroll', updateScrollClasses);
      
      // Initial check
      setTimeout(updateScrollClasses, 100);
      
      // Check again when items are loaded
      this.$watch('categories', () => {
        this.$nextTick(() => {
          setTimeout(updateScrollClasses, 100);
        });
      });
    },
    
    // Modern notification system with queue management
    showNotification(message, type, duration = 3000) {
      // Remove any existing notifications first
      this.clearAllNotifications();
      
      // Create notification element
      const notification = document.createElement('div');
      notification.className = `shop-notification ${type}`;
      notification.innerHTML = `
        <div class="notification-content">
          <i class="fas ${type === 'success' ? 'fa-check-circle' : type === 'error' ? 'fa-exclamation-circle' : type === 'warning' ? 'fa-exclamation-triangle' : 'fa-info-circle'}"></i>
          <span>${message}</span>
        </div>
      `;
      
      // Add unique ID for tracking
      notification.setAttribute('data-notification-id', Date.now());
      
      // Add to DOM
      document.body.appendChild(notification);
      
      // Animate in
      setTimeout(() => {
        notification.classList.add('show');
      }, 100);
      
      // Store reference for cleanup
      this.currentNotification = notification;
      this.isShowingNotification = true;
      
      // Remove after duration
      setTimeout(() => {
        this.hideNotification(notification);
      }, duration);
    },
    
    hideNotification(notification) {
      if (notification && notification.parentNode) {
        notification.classList.remove('show');
        setTimeout(() => {
          if (notification.parentNode) {
            notification.parentNode.removeChild(notification);
          }
          this.isShowingNotification = false;
          this.currentNotification = null;
        }, 300);
      }
    },
    
    clearAllNotifications() {
      // Remove all existing notifications
      const existingNotifications = document.querySelectorAll('.shop-notification');
      existingNotifications.forEach(notification => {
        this.hideNotification(notification);
      });
      this.isShowingNotification = false;
      this.currentNotification = null;
    },
    
    // Update player balance when received from server
    updatePlayerBalance(cash, bank) {
      this.playerBalance = cash;
      this.playerBankBalance = bank;
      // Could also show bank balance separately if needed
      console.log('Balance updated:', { cash, bank });
    }
  },
  mounted() {
    console.log('Vue app mounted successfully');
    console.log('Initial searchQuery:', this.searchQuery);
    
    // Setup category filter scroll handling
    this.$nextTick(() => {
      this.setupCategoryScrollHandling();
    });
    
    // NUI Message Handler
    window.addEventListener('message', (event) => {
      const data = event.data;
      console.log('NUI Message received:', data);
      
      if (data.type === 'ui') {
        this.ui = true;
        
        // Reset categories, items and selected category first
        this.categories = [];
        this.shopItems = [];
        this.selectedCategory = 'All';
        this.selectedItem = null;
        
        if (data.categories) {
          this.categories = [...data.categories]; // Create a new array to trigger reactivity
        }
        
        if (data.shop && data.shop.Items) {
          this.shopItems = data.shop.Items.map(item => ({
            ...item,
            image: item.image || 'https://images.unsplash.com/photo-1595590424283-b8f17842773f?w=300&h=200&fit=crop&crop=center',
            mainStat: {
              label: item.stats && item.stats.damage ? 'Weapon Damage' : 
                     item.stats && item.stats.armor ? 'Armor' : 'Price',
              value: item.stats && item.stats.damage ? item.stats.damage.toLocaleString() : 
                     item.stats && item.stats.armor ? item.stats.armor.toLocaleString() : 
                     '$' + item.price.toLocaleString(),
              bonus: item.stats && item.stats.damage ? Math.floor(item.stats.damage * 0.12).toLocaleString() : 
                     item.stats && item.stats.armor ? Math.floor(item.stats.armor * 0.1).toLocaleString() : null,
              icon: item.stats && item.stats.damage ? 'fas fa-crosshairs' :
                    item.stats && item.stats.armor ? 'fas fa-shield-alt' : 'fas fa-dollar-sign'
            },
            description: `High-quality ${item.type.toLowerCase()} with exceptional performance. Level ${item.level || 'N/A'} requirement.`,
            comparison: 'better'
          }));
          
          // Auto-select first item
          if (this.shopItems.length > 0) {
            this.selectedItem = this.shopItems[0];
          }
        }
        
        if (data.shopName) {
          this.shopName = data.shopName;
        }
        
        // Get initial player balance
        $.post(`https://${GetParentResourceName()}/getUserMoney`, JSON.stringify({}), (response) => {
          if (response.cash !== undefined) {
            this.updatePlayerBalance(response.cash, response.bank);
          }
        });
      }
      
      // Handle balance updates from server
      else if (data.type === 'updateBalance') {
        this.updatePlayerBalance(data.cash, data.bank);
      }
      
      // Handle purchase effects
      else if (data.type === 'purchaseEffect') {
        this.showNotification(`Purchased ${data.quantity}x ${data.item.name}!`, 'success');
      }
      
      // Handle cart purchase effects
      else if (data.type === 'cartPurchaseEffect') {
        if (data.failedItems && data.failedItems.length > 0) {
          this.showNotification(`${data.successCount} items purchased. Some failed: ${data.failedItems.join(', ')}`, 'warning');
        } else {
          this.showNotification(`Successfully purchased ${data.successCount} items!`, 'success');
        }
      }
      
      // Handle custom notifications
      else if (data.type === 'notification') {
        this.showNotification(data.message, data.notificationType, data.duration);
      }
    });
    
    // Keyboard event listeners for FiveM integration
    document.addEventListener('keydown', (e) => {
      // Check if any input field is focused (especially search input)
      const activeElement = document.activeElement;
      const isInputFocused = activeElement && (
        activeElement.tagName === 'INPUT' || 
        activeElement.tagName === 'TEXTAREA' ||
        activeElement.classList.contains('search-input')
      );
      
      switch(e.key.toLowerCase()) {
        case 'e':
          // Don't close shop if typing in search input or any input field
          if (this.ui && !isInputFocused) {
            this.closeShop();
          }
          break;
        case 'g':
          // Only trigger if not typing in input
          if (!isInputFocused) {
            // Toggle compare mode (could be implemented)
            console.log('Compare mode toggled');
          }
          break;
        case 'c':
          // Only trigger if not typing in input
          if (!isInputFocused) {
            // Toggle cart
            this.toggleCart();
          }
          break;
        case 'escape':
          // Escape should work even when input is focused
          if (this.showCart) {
            this.closeCart();
          } else if (this.ui) {
            // If search input is focused, clear it first, then close shop on second escape
            if (isInputFocused && this.searchQuery) {
              this.clearSearch();
              activeElement.blur();
            } else {
              this.closeShop();
            }
          }
          break;
      }
    });
    
    // Auto-select first item if available
    if (this.shopItems.length > 0) {
      this.selectedItem = this.shopItems[0];
    }
  }
});
