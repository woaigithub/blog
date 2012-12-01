# blog

## framework: ruby on rails

### users
* id
* nickname
* email
* password_digest
* password_salt
* created_at
* updated_at

### tags
* id
* title
* created_at
* updated_at

### categorys
* id
* title
* created_at
* updated_at

### comments
* id
* commenter
* commenter_email
* commenter_url
* content
* post_id
* created_at
* updated_at

### posts
* id
* title
* slug
* category_id
* summary
* content
* created_at
* updated_at
* user_id

### posts_tags
* post_id
* tag_id




