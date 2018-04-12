# System

## Table structure

| table name | column name  | data type |
| ---------- | ------------ | --------- |
| sales      | price_crypto | integer   |
|            | user_id      | integer   |
|            | price_yen    | integer   |
|            | memo         | text      |
|            | confirmed    | boolean   |
|            | updated_at   | datetime  |
|            | created_at   | datetime  |


| table name | column name  | data type |
| ---------- | ------------ | --------- |
| xem_price  | price_zaif   | integer   |
|            | price_polo   | integer   |
|            | updated_at   | datetime  |
|            | created_at   | datetime  |


`excepting devise generated column`

| table name | column name | data type |
| ---------- | ----------- | --------- |
| users      | name        | string    |
|            | xem_address | json      |
