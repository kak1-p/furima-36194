# README
## Users
|Column|Type|Options|
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| birth       | datetime | null: false |

### Association
has_many :items
has_many :purchase


## Items
|Column|Type|Options|
| items_name  | string  | null: false |
| category    | string  | null: false |
| price       | integer | null: false |
| image       | ActiveStorage |
| user        | reference | foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## Purchase
|Column|Type|Options|
| user        | reference | foreign_key: true |

### Association
belongs_to :item
has_one :address


## Address
|Column|Type|Options|
| postal_code | integer | null: false |
| city      |
| purchase  | reference | foreign_key: true |


### Association
belongs_to :purchase


