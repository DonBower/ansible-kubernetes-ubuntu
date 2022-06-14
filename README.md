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

## 2022-06-11 Some More Success
I am able to use my on CA.  The trick was reading the error. The server cert/key I was using was not a CA.  It does not want the Server Cert, but the CA.  I have a [Self-signed CA](https://github.com/DonBower/root-ca) I am using for consistancy. Once I used that, Then I was able to have a clean build in [virtualbox-via-vagrant](https://github.com/DonBower/kubernetes-via-ansible/tree/main/virtualbox-via-vagrant).

I also re-added the code to merge the admin.conf file with my local ~/.kube/config file.  The trick here is to rename the user, kubernetes-admin, to a unique name, otherwise the join merges the two users.
When I can figure out how to rename that user at build time, or somehow use the same keys for each cluster, then I won't have to fake it out, I can seperate users, or I can use the same user, either way works.

This version has moved the "roles" to a common directory.
I am also working esxi-via-vagrant.

## 2022-06-11 Some Ubuntu Success Some esxi-via-vagrant failure
First the bad news.
I was not able to get a consistant build of ESXi hosts because the Vagrant file is just not correct.
It does not build consistantly, sometimes 1 host works, sometimes 2, but never all three, and I really want 4, maybe 5 in the end.

For Ubuntu, I scratched all 4 servers by hand, I know, I know! But afterword, much success.  I do think I need to let the builds settle in before I pound them with all these updates, or perhaps my little ESXi server just can't handle it, not sure which at the moment, so even though two of the hosts did not build the first run, they did build on the second.
I think I will try to get a Terraform build working, and then give it another throw.