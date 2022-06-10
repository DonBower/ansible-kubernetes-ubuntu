# ansible-kubernetes-ubuntu
The purpose of this project is to stand up a kubenetes cluster on 4 ubuntu servers running on ESXi Lenovo Xeon host

To start, I am using [Ubuntu Server 20.04 LTS](https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso)

I have to manually build these servers out at this time becase I can't get this [Vagrant plugin](https://github.com/josenk/vagrant-vmware-esxi) to work, which talks to the ESXi Server via SSH and Terraform requires the ESXi API to be enabled, which is $$$$. I thank VMWare for the free ESXi, but without the API, a lot of manual work is instore

In addition, I am not really forking [Jeff Geerling's repo](https://github.com/geerlingguy/ansible-for-kubernetes), but I am borrowing from it - heavly. Numerous quanities of kilograms. I'm a supporter, so I hope he does not mind.

Also, I am using ansible [core 2.12.6].

So let's get started.

## 2022-06-10 Some Success
The [Vagrant plugin](https://github.com/josenk/vagrant-vmware-esxi) is working.  Thanks to an upgrade of ovftool to 4.4.3. The version I was using previously, 4.3.1, had the bug. The upgrade cleared everything up, it's working well now.

`virtualbox-via-vagrant` is also working well.  I just need to update this to start using my own certs, because when I have multiple clusters created, the `client-certificate-data:` and `client-key-data:` for kubernetes-admin are different, and for me to circle around, I either need the same cert or multiple .kube/config files.  I may choose the latter