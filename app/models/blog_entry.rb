# coding: utf-8

class BlogEntry < ActiveRecord::Base
  attr_accessible :blog_author_id, :title, :unsafe_html

  default_scope order: 'created_at DESC'
  paginates_per 5

  belongs_to :blog_author

  validates :blog_author_id,
    presence: { message: '投稿者を選択してください。初投稿の場合は執筆者登録が必要です。' }

  validates :title,
    presence: { message: 'タイトルを入力してください。' },
    uniqueness: { message: '同じタイトルの投稿が既に存在します。' }

  validates :unsafe_html,
    presence: { message: '本文を入力してください。' }
end
