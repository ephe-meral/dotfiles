#!/bin/sh

# This command will decrement the brightness value if 
# possible and use the appropriate acpi call for
# the Lenovo T420 with Intel Graphics

VAL=`brdown.sh`
acpi_call -p '\_SB.PCI0.VID.LCD0._BCM' -i $VAL
