## First Catastophe
I had a new window installed in my `office`, you know the enery efficient kind.  Well, I had to temporarly shut down my ESXi host and move it while the contractor installed it, and after restart, it well doesn't restart!

Good news. RJ45 not installed with the `click` which was a quick fix

well looks like i need to rebuild the servers from scratch again.
it appears that once you inject the wrong ip, there is no going back to the right one:

"stderr": "Unable to connect to the server: dial tcp 192.168.2.41:6443: connect: no route to host"

It should be .2.20