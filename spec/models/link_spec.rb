require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should belong_to :user }
  it { should have_many(:tags).through(:link_tags) }
  it { should have_many(:link_tags).dependent(:destroy) }
  it { should have_db_column(:read).with_options(default: 'false') }

  it 'should have a relationship' do
    user = User.create(email: "lane@nil.com", password: "password", password_confirmation: "password")
    tag = Tag.create(name: "tagOne")
    tag2 = Tag.create(name: "tagTwo")
    link = Link.create(
      title: 'First Idea',
      url: 'https://github.com/',
      user: user,
      tags: [tag, tag2]
    )

    expect(link.link_tag).to eq("tagOne, tagTwo")
  end
end
