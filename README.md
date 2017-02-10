To configure ZNC, first run the container with the `--makeconf`
option:

    docker run --rm -it -v volume_name:/var/lib/znc larsks/znc --makeconf

And then afterwards start it using the same volume mounted on
`/var/lib/znc`, making sure to publish any configured ports:

    docker run --name znc -v volume_name:/var/lib/znc -p 8443:8443 larsks/znc
