
mbedtls package used for testing applications that depend on this library.

see gentoo bugzilla [bug #805011](https://bugs.gentoo.org/805011#c10) for details.

required package.mask modification:

```
<=net-libs/mbedtls-3.1.0
>=net-libs/mbedtls-3.6.2-r10
```

impacted packages | compiles | connects
--- | --- | ---
app-crypt/tpm2-tss | NA | NA
app-misc/openrgb | NA | NA
dev-games/godot | NA | NA
dev-lang/haxe | NA | NA
dev-lang/julia | NA | NA
dev-lang/neko | NA | NA
dev-libs/libevent | NA | NA
dev-libs/libzip | NA | NA
dev-libs/pkcs11-helper | NA | NA
dev-scheme/gauche | NA | NA
games-emulation/dolphin | NA | NA
media-video/obs-studio | NA | NA
net-dns/inadyn | NA | NA
net-irc/inspircd | NA | NA
net-libs/librist | NA | NA
net-libs/libssh | NA | NA
net-libs/libssh2 | NA | NA
net-libs/libwebsockets | NA | NA
net-misc/curl | NA | NA
net-news/newsboat | NA | NA
net-p2p/fms | NA | NA
net-p2p/transmission | NA | NA
net-proxy/privoxy | NA | NA
net-proxy/shadowsocks-libev | NA | NA
net-voip/umurmur | yes [1] | yes
net-vpn/openvpn | NA | NA
sys-firmware/edk2 | NA | NA
sys-fs/dislocker | NA | NA
www-apps/ttyd | NA | NA
www-client/dillo | NA | NA
www-servers/lighttpd | NA | NA
www-servers/mongrel2 | NA | NA

[1] tested with version from [overlay](https://github.com/rodan/overlay/tree/master/net-voip/umurmur)

