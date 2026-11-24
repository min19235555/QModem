# openluat

(no module enabled in the ONLY-RG200U build)

# huawei

(no module enabled in the ONLY-RG200U build)

# quectel

Model | Platform | USB | PCIe
--- | --- | --- | ---
rg200u-cn | unisoc |✔ usb(ecm,mbim,rndis,ncm) | ✘

Only Quectel RG200U-CN is kept in this build. ECM, MBIM, RNDIS and NCM are all
available; ECM (`usb0`) is the default preset. ttyUSB2 (USB interface 4) is
reserved for AT management.
