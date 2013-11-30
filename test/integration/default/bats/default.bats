#!/usr/bin/env bats

@test "installed jq executable" {
    [ -x "/usr/local/bin/jq" ]
}

@test "jq executable runs" {
    echo {} | /usr/local/bin/jq .
}
