# Use AXI IIC interface

## Description

Use the AXI IIC IP to communicate with the IMX274 camera

## Getting Started

### Dependencies

* Ubuntu 22.04
* Vivado 18.03
* Xilinx ZCU106
* MPSoC IP and AXI IIC IP

### Basis of I2C protcol

* Partioner: master controllers (master) and slave controllers (slave).

    For example:
    * 1 controller + 1 slave
    * 1 controller + $N$ slave
    * $N$ controller + $N$ slace

* 
