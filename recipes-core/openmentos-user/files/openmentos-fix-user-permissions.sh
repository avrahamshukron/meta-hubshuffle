#!/usr/bin/env bash

USERNAME="mentos"

OWNER=$(stat -c '%U' /home/${USERNAME})

[ "${OWNER}" != "${USERNAME}" ] && chown -R ${USERNAME}:${USERNAME} "/home/${USERNAME}"
