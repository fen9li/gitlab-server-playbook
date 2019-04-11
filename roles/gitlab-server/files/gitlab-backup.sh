#!/usr/bin/env bash

# clean up old backups
rm -f /secret/gitlab/backups/*
rm -f /var/opt/gitlab/backups/*

# backup gitlab configuration and secrets for the day
sh -c 'umask 0077; tar cfz /secret/gitlab/backups/$(date "+etc-gitlab-%s.tgz") -C / etc/gitlab'

# backup gitlab data and databases for the day
/bin/gitlab-rake gitlab:backup:create
