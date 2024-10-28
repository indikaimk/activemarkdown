class Article < ApplicationRecord
  has_one :document, class_name: "ActiveMarkdown::Document"

  after_create do |article|
    document = ActiveMarkdown::Document.new
    document.article = article
    document.save
  end
end
