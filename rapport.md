Introduction
=====

NVMe stands for NVM Express (NVM stands for non-volatile memory).
Nvme is designed from the ground up to take advantage of the flash storage
properties unlike SATA or SAS.
These old buses where designed with mechanical hard drives in mind.
For example SATA has those limitations:

 - Upper transfer limit of 600 MB/s
 - Uses the AHCI standard
    Not designed with flash storage in mind (Optimized for slow read/write and
    not much concurent access)

Flash storage used in SSD are capable of speeds exceeding 600 MB/s and capable
of accessing lots of data at once.
 
NVMe takes advantage of those capabilities and enables greater throughput and
less latency by utilizing the pcie bus. It parallelize instructions to a
greater extend than the SATA and SAS buses do.

Command queueing is the amount of data a drive can handle at one time. AHCI can
handle 1 queue with a maximum of 32 commands, by comparison NVMe allows up to
64K queues with a maximum of 64K commands.

