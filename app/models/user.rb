class User < ApplicationRecord
    #パスワード認証機能を追加
    has_secure_password
    # 名前の入力を必須にして、「名前を入力してください」というエラーメッセージをつける
    validates :name,presence: {message: "を入力してください" }
    # メールアドレスの入力を必須にして、「メールアドレスを入力してください」というエラーメッセージをつける
    validates :email,presence: {message: "を入力してください" }
    # メールアドレスはユニークとし、「メールアドレスはすでに使用されています」というエラーメッセージをつける
    validates :email, uniqueness: { message: 'はすでに使用されています' }
    # パスワードの入力を必須にして、「パスワードを入力してください」というエラーメッセージをつける
    validates :password,presence: {message: "パスワードを入力してください" }
    # パスワードは6文字未満とし、「パスワードは6文字以上で入力してください」というエラーメッセージをつける
    validates :password,length: { minimum: 6, too_short: "パスワードは6文字以上で入力してください" }
    before_validation { email.downcase! }
    has_many :tasks
    

end
