name "buildslave"
description "buildslave"
run_list "recipe[buildbot]", "recipe[buildslave]"
