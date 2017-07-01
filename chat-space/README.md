## messages table

|Column|Type|Options|
|------|----|-------|
|body|text| |
|image|string| |
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :group
___________________________________________________________

## members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|group_id|integer|null: false,foreign_key: true|

### Association
-belongs_to :group
-belongs_to :user
___________________________________________________________

## users table

|Column|Type|Options|
|------|----|-------|

|name|string|null: false, unique:true, index :true|
|mail|string|null: false|

### Association
-has_many :groups, through: members
-has_many :messages
-has_many :members
___________________________________________________________

## groups table

|Column|Type|Options|
|------|----|-------|

|name|string|null: false, unique:true|

### Association
-has_many :members
-has_many :users
-has_many :messages
