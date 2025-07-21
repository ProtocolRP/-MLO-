Thank you for purchasing Fiv3Devs' Pillbox Hill Medical Center!

- *Stuck in the elevator?*

Do not rename the resource! The original name is "fiv3devs_pillbox"

- *Want to disable the script?*

Head over to \fiv3devs_pillbox\script\config.lua, open it with your favorite code editor and set it to "false" what you want to disable.

- *Want to make the map even lighter?*

You can disable two floors, the "offices" and the "underground". To do that, head over to the "stream" folder and delete folders "-1_basement" and
"2_office". Then, open file "config.lua" located here \fiv3devs_pillbox\script\config.lua and set Config.EnabledUnderground and Config.EnabledOffices to false. 

- *Want to change logos/textures?*

Watch this video here: https://youtu.be/w7fUTrDcF64

The script is specifically for ESX and QBCore, but if you don't set Config,EnableJobs to true, any framework is supported.

- *Events for MRI and X-RAY*

You can toggle the MRI and X-RAY with these EVENTS here:

MRI:
TriggerEvent('fiv3devs_pillbox:startMri')

X-RAY:
TriggerEvent('fiv3devs_pillbox:startXray')

Example:

-- Client-side script
RegisterCommand('startmri', function()
    -- Trigger the event "fiv3devs_pillbox:startMri"
    TriggerEvent('fiv3devs_pillbox:startMri')
end, false)

-----------------------------------

A few hashes:

4-seat bench - 5d_pillbox_sedute,ydr -  hash: 744272845 - hex: 2C5CB3CD
2-seat bench - 5d_pillbox_sedute2.ydr - hash: 1287236346 - hex: 4CB9AAFA
blue medic bed - 5d_pillbox_lettino.ydr - hash: 2343318014 - hex:  8BAC31FE
stool - 5d_pillbox_sgabello.ydr - hash: 3811930155 - hex: E335702B
white plastic chair - 5d_pillbox_sedia.ydr - hash: 3385033765 - hex: C9C38425
patients bed - 5d_pillbox_letto1.ydr - hash: 3666222248 - hex: DA861CA8
chapel bench - 5d_pillbox_capsedute.ydr - hash: 3419642828 - hex: CBD39BCC
surgery bed - 5d_pillbox_letto_operatorio.ydr - hash: 4085072064 - hex: F37D40C0
morgue bed - 5d_pillbox_obitorio_tavolo1.ydr -hash: 1037322949 - hex: 3DD44AC5

MEDICAL BEDS *LOCAL* COORDINATES (for easy removal):

------------MAIN FLOOR------------

Clinic 2: 4.828979, -2.803162, -1.868664
Surgery: 6.039429, 9.506105, -1.198071
Physiotherapy: 15.66614, -2.844543, -1.859016
Room 1: 27.13818, -12.06384, -1.305962
Room 2: 31.7963, -9.886413, -1.302971
Room 3: 36.56711, -7.667419, -1.301453
Room 4: 41.34787, -5.472656, -1.314182
Recovery close left : 27.01282, 12.51746, -1.303322
Recovery close right: 30.10501, 5.844176, -1.303322
Recovery far left: 30.76416, 14.25079, -1.303322
Recovery far right: 33.77185, 7.564148, -1.303322


-----------------ER----------------

Triage left: 29.24864, 21.98299, -16.47255
Triage right: 31.71938, 21.98294, -16.47255
Trauma 1 : 31.92938, 33.25, -16.45949
Trauma 2 : 26.25624, 34.99667, -16.4549
Recovery close left: 15.80591, 28.57211, -15.89122
Recovery middle left: 15.80591, 32.54114, -15.89122
Recovery middle right: 20.16598, 32.54117, -15.89122
Recovery far left: 15.80591, 36.86001, -15.89122
Recovery far right: 20.16597, 36.77975, -15.89122 
