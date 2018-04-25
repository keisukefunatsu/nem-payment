# System

## Table structure

- sales    

| column name | data type |
| ----------- | --------- |
| price_xem   | integer   |
| shop_id     | integer   |
| price_yen   | decimal   |
| memo        | text      |
| xem_message | string    |
| xem_address | string    |
| confirmed   | boolean   |
| updated_at  | datetime  |
| created_at  | datetime  |


- xem_prices

| column name | data type |
| ----------- | --------- |
| price_zaif  | decimal   |
| price_cap   | decimal   |
| updated_at  | datetime  |
| created_at  | datetime  |


`excepting devise generated column`

- profile

| column name | data type |
| ----------- | --------- |
| name        | string    |
| xem_address | string    |
| tel_number  | string    |
| shop_id     | integer   |

## communication with APIs


## Creating Sales
