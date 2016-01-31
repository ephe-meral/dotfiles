#!/bin/sh

# This command will increment the brightness value if 
# possible and use the appropriate acpi call for
# the Lenovo T420 with Intel Graphics

VAL=`brup.sh`
acpi_call -p '\_SB.PCI0.VID.LCD0._BCM' -i $VAL
