@echo off
set arg_to_run=%1
runas /user:%UserAdmin% %arg_to_run%