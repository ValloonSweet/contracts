#!/bin/bash
set -e
cd "$(dirname $0)"

[ "$#" -eq 1 ] || die "One Account ID argument required, $# provided"

export ACCOUNT_ID=$1

export SKYWARD_TOKEN_ID=token.$ACCOUNT_ID

near create-account $SKYWARD_TOKEN_ID --masterAccount=$ACCOUNT_ID --initialBalance=3
near deploy $SKYWARD_TOKEN_ID common/fungible_token.wasm new '{"owner_id": "'$ACCOUNT_ID'", "total_supply": "1000000000000000000000000", "metadata": {"spec": "ft-1.0.0", "name": "Test Skyward Finance Token", "symbol": "TEST_SKYWARD", "icon": "data:image/png;base64,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", "decimals": 18}}'

export WRAP_NEAR_TOKEN_ID=wrap_near.$ACCOUNT_ID

near create-account $WRAP_NEAR_TOKEN_ID --masterAccount=$ACCOUNT_ID --initialBalance=3
near deploy $WRAP_NEAR_TOKEN_ID common/w_near.wasm new '{}'

near call $WRAP_NEAR_TOKEN_ID --accountId=$ACCOUNT_ID near_deposit '{}' --amount=10

export CONTRACT_ID=$ACCOUNT_ID

# near create-account $CONTRACT_ID --masterAccount=$ACCOUNT_ID --initialBalance=4
near deploy $CONTRACT_ID skyward/res/skyward.wasm new '{"skyward_token_id": "'$SKYWARD_TOKEN_ID'", "skyward_total_supply": "1000000000000000000000000", "listing_fee_near": "10000000000000000000000000", "w_near_token_id": "'$WRAP_NEAR_TOKEN_ID'"}'

near call $SKYWARD_TOKEN_ID --accountId=$ACCOUNT_ID storage_deposit '{"account_id": "'$CONTRACT_ID'"}' --amount=0.00125
near call $WRAP_NEAR_TOKEN_ID --accountId=$ACCOUNT_ID storage_deposit '{"account_id": "'$CONTRACT_ID'"}' --amount=0.00125

export ALICE=alice.$ACCOUNT_ID
near create-account $ALICE --masterAccount=$ACCOUNT_ID --initialBalance=20

export BOB=bob.$ACCOUNT_ID
near create-account $BOB --masterAccount=$ACCOUNT_ID --initialBalance=20

export COBB=cobb.$ACCOUNT_ID
near create-account $COBB --masterAccount=$ACCOUNT_ID --initialBalance=20

near call $SKYWARD_TOKEN_ID --accountId=$ACCOUNT_ID ft_transfer '{"receiver_id": "'$CONTRACT_ID'", "amount": "900000000000000000000000"}' --amount=0.000000000000000000000001
export DATE=
near call $CONTRACT_ID --accountId=$CONTRACT_ID sale_create '{"sale": {
                "title": "SKYWARD sale",
                "url": "https://skyward.finance/sale",
                "out_tokens": [{
                  "token_account_id": "'$SKYWARD_TOKEN_ID'",
                  "balance": "900000000000000000000000"
                }],
                "in_token_account_id": "'$WRAP_NEAR_TOKEN_ID'",
                "start_time": "1621544319000000000",
                "duration": "31536000000000000"
            }}'
