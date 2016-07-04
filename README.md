# PuSu testing environment

Sets up [PuSud](https://github.com/PuSuEngine/pusud) and provides a frontend
with [jspusu](https://github.com/PuSuEngine/jspusu) and a couple of backend
applications using [gopusu](https://github.com/PuSuEngine/gopusu) and
[pypusu](https://github.com/PuSuEngine/pypusu).


## Requirements

 * [Vagrant](https://www.vagrantup.com/downloads.html)
 * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

On most custom built PCs you will have to make sure you have hardware
virtualization support enabled in BIOS for VirtualBox to work properly. However
I'm not going to tell you how to do it here as it depends on your system.


## Setup

Clone/download this repository, and open a terminal in the folder you put it in
and run the command:

```
vagrant up
```

With that, your environment will be automatically prepared,
for those parts where it makes sense. 

The `pusud` and `gopusu` -repositories will be cloned under
the `gopath` -folder as dependencies for things and will
show up in the source directory outside the VM in case you
want to make local changes.

You will need to compile the web-client to `frontend/www`
yourself if you want to try that out. After building it
will be available at `http://172.20.20.20/`. 

The `pusud` -API is going to be available at
`127.0.0.1:55000` inside the VM, and 
`http://172.20.20.20:80/pusu` outside it.


## Status

This is still incomplete.

For frontend you will have to manually install a production build of `jspusu` to `frontend/www/lib/pusu.js`, and copy `frontend/src/*` to `frontend/www`.

For Python backend you will need to copy the `pypusu` module in the `python-backend/pypusu` -directory so `import pypusu` works in the `python-backend` -directory.
