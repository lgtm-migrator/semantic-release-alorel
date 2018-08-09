#!/usr/bin/env bash

openssl aes-256-cbc -K $encrypted_4e5a3cbd1d98_key -iv $encrypted_4e5a3cbd1d98_iv -in git_gpg_keys.asc.enc -out /tmp/gpg-with-passphrase -d
chmod 600 /tmp/git_gpg_keys.asc
gpg --batch --yes --import /tmp/git_gpg_keys.asc
echo '/usr/bin/gpg2 --passphrase ${GPG_PASSPHRASE} --batch --no-tty "$@"' > /tmp/gpg-with-passphrase && chmod +x /tmp/gpg-with-passphrase
git config gpg.program "/tmp/gpg-with-passphrase"
git config commit.gpgsign true
git config --global user.signingkey ${GPG_KEY_ID}
