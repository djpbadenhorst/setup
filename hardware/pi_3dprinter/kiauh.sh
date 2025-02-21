sudo apt-get update && sudo apt-get install git -y
cd ~ && git clone https://github.com/dw-0/kiauh.git
LC_ALL=C ./kiauh/kiauh.sh

echo "To build klipper.bin:"
echo "STMicroelectronics"
echo "STM32F103"
echo "28KiB bootloader"
echo "USART1 PA10/PA9"
echo "28KiB bootloader"
echo "USART3 PB11/PB10"

git clone https://github.com/mainsail-crew/sonar.git
cd ~/sonar
make config
sudo make install

#########################
# PRINTER.CONF SETTINGS #
#########################
# [include mainsail.cfg]
# [mcu]
# serial: /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
# 
# [virtual_sdcard]
# path: /home/djpb/printer_data/gcodes
# on_error_gcode: CANCEL_PRINT
# 
# [stepper_x]
# step_pin: PB9
# dir_pin: PC2
# enable_pin: !PC3
# microsteps: 16
# rotation_distance: 40
# endstop_pin: ^PA5
# position_endstop: -2
# position_min: -2
# position_max: 227
# homing_speed: 50
# 
# [stepper_y]
# step_pin: PB7
# dir_pin: PB8
# enable_pin: !PC3
# microsteps: 16
# rotation_distance: 40
# endstop_pin: ^PA6
# position_endstop: 0
# position_min: 0
# position_max: 224
# homing_speed: 50
# 
# [stepper_z]
# step_pin: PB5
# dir_pin: !PB6
# enable_pin: !PC3
# microsteps: 16
# rotation_distance: 8
# endstop_pin: probe:z_virtual_endstop
# position_min: -5
# position_max: 250
# 
# [extruder]
# max_extrude_only_distance: 100.0
# step_pin: PB3
# dir_pin: PB4
# enable_pin: !PC3
# microsteps: 16
# rotation_distance: 33.500
# nozzle_diameter: 0.400
# filament_diameter: 1.750
# heater_pin: PA1
# sensor_type: EPCOS 100K B57560G104F
# sensor_pin: PC5
# control: pid
# pid_Kp: 21.527
# pid_Ki: 1.063
# pid_Kd: 108.982
# min_temp: 0
# max_temp: 250
# 
# [heater_bed]
# heater_pin: PA2
# sensor_type: EPCOS 100K B57560G104F
# sensor_pin: PC4
# control: pid
# pid_Kp: 54.027
# pid_Ki: 0.770
# pid_Kd: 948.182
# min_temp: 0
# max_temp: 130
# 
# [fan]
# pin: PA0
# 
# [mcu]
# serial: /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
# restart_method: command
# 
# [printer]
# kinematics: cartesian
# max_velocity: 300
# max_accel: 3000
# max_z_velocity: 5
# max_z_accel: 100
# 
# [board_pins]
# aliases:
#   EXP1_1=PC6,EXP1_3=PB10,EXP1_5=PB14,EXP1_7=PB12,EXP1_9=<GND>,
#   EXP1_2=PB2,EXP1_4=PB11,EXP1_6=PB13,EXP1_8=PB15,EXP1_10=<5V>,
#   PROBE_IN=PB0,PROBE_OUT=PB1,FIL_RUNOUT=PC6
# 
# [respond]
# default_type: command
# 
# [pause_resume] recover_velocity: 50
# 
# [bltouch]
# sensor_pin: ^PB1
# control_pin: PB0
# x_offset: -35
# y_offset: -11
# #z_offset: 3
# 
# [safe_z_home]
# home_xy_position: 117.5,117.5
# z_hop: 10
# 
# [bed_mesh]
# speed: 120
# horizontal_move_z: 5
# mesh_min: 20, 20
# mesh_max: 190, 200
# probe_count: 7,7
# algorithm: bicubic
# fade_start: 1
# fade_end: 10
# fade_target: 0
# 
# [temperature_sensor raspberry_pi]
# sensor_type: temperature_host
# min_temp: 10
# max_temp: 100
# 
# [temperature_sensor mcu_temp]
# sensor_type: temperature_mcu
# min_temp: 0
# max_temp: 100
# 
# #*# <---------------------- SAVE_CONFIG ---------------------->
# #*# DO NOT EDIT THIS BLOCK OR BELOW. The contents are auto-generated.
# #*#
# #*# [bed_mesh default]
# #*# version = 1
# #*# points =
# #*# 	  0.002500, 0.075000, 0.117500, 0.182500, 0.115000, 0.162500, 0.182500
# #*# 	  0.030000, 0.015000, 0.095000, 0.140000, 0.127500, 0.110000, 0.110000
# #*# 	  -0.017500, 0.060000, 0.065000, 0.075000, -0.020000, 0.085000, 0.057500
# #*# 	  -0.042500, 0.030000, 0.017500, 0.007500, -0.057500, -0.027500, -0.005000
# #*# 	  -0.010000, -0.002500, -0.005000, 0.280000, 0.035000, -0.040000, 0.060000
# #*# 	  0.010000, 0.090000, 0.070000, 0.122500, 0.057500, 0.097500, 0.047500
# #*# 	  0.102500, 0.177500, 0.152500, 0.205000, 0.117500, 0.175000, 0.077500
# #*# x_count = 7
# #*# y_count = 7
# #*# mesh_x_pps = 2
# #*# mesh_y_pps = 2
# #*# algo = bicubic
# #*# tension = 0.2
# #*# min_x = 20.0
# #*# max_x = 189.97
# #*# min_y = 20.0
# #*# max_y = 200.0
# #*#
# #*# [bltouch]
# #*# z_offset = 0.700
