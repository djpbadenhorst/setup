sudo apt-get update && sudo apt-get install git -y
cd ~ && git clone https://github.com/dw-0/kiauh.git
LC_ALL=C ./kiauh/kiauh.sh

echo "Copy settings from data/printer.conf"

echo "To build klipper.bin:"
echo "STMicroelectronics"
echo "STM32F103"
echo "28KiB bootloader"
echo "USART1 PA10/PA9"
echo "28KiB bootloader"
echo "USART3 PB11/PB10"
