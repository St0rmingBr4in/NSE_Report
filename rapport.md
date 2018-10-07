Introduction
=====

NVMe stands for NVM Express (NVM stands for non-volatile memory).
Nvme is designed from the ground up to take advantage of flash storage
properties unlike other some buses like SATA or SAS.
These old buses where designed with mechanical hard drives in mind, thus, while
suitable for use along with mechanical hard drives, they present some major
limitations when used along with flash storage.

For example SATA has those limitations:

 - Upper transfer limit of 600 MB/s
 - Uses the AHCI standard
    Not designed with flash storage in mind (Optimized for slow read/write and
    not much concurent access)

Flash storage used in SSD are now capable of speeds exceeding 600 MB/s and
capable of accessing lots of data at once. NVMe takes advantage of those
capabilities and enables greater throughput and less latency by utilizing the
pcie bus. It parallelize instructions to a greater extend than the SATA and SAS
buses do.

Command queueing defines the amount of data a drive can handle at one time.
AHCI can handle 1 queue with a maximum of 32 commands, by comparison NVMe
allows up to 64K queues with a maximum of 64K commands.


Passthrough using SR-IOV
======

NVMe passthrough can be achieved using SR-IOV. SR-IOV (single root input/output
virtualization) is an extension of the PCIe specification. It allows a PCIe
device to expose its resources through PCIe hardware functions. It allows also
different virtual machines to share a single PCIe hardware interface.

 - There is a PCIe Physical Function (PF), which is the primary function of the
 device and also discloses the device's SR-IOV capabilities.

 - There are also one or more PCIe Virtual Functions (VFs), which shares some
 physical resources of the device. Theses are what interest us in the context
 of NVMe passthrough. Indeed, thanks to these PCIe Virtual Functions, it is
 possible to reduce the overhead associated with virtualization by giving
 access to these to the guest.

Passthrough without SR-IOV
======

In the version 1.3 of the NVMe specification released Q2 of 2017, some
virtualization features where added.

 - Direct Assignment
  IMAGE slide 13


