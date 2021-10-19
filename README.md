# README
## Users
|Column|Type|Options|
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_k      | string | null: false |
| first_name_k       | string | null: false |
| birth              | date | null: false |

### Association
- has_many :items
- has_many :purchases


## Items
|Column|Type|Options|
| ----------- | ------- | ----------- |
| items_name  | string  | null: false |
| detail      | text    | null: false |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| fee_id      | integer | null: false |
| city_id     | integer | null: false |
| delivery_date_id     | integer | null: false |
| price       | integer | null: false |
| user        | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## Purchases
|Column|Type|Options|
| ----------- | --------- | ----------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addresses
|Column|Type|Options|
| ----------- | ------- | ----------- |
| postal_code | string  | null: false |
| city_id     | integer | null: false |
| town        | string  | null: false |
| number      | string  | null: false |
| building    | string  |             |
| tell        | string  | null: false |
| purchase  | references | foreign_key: true |


### Association
- belongs_to :purchase


