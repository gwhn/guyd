require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  test "must belong to a section" do
    orphan = Content.new
    assert !orphan.valid?
    assert orphan.errors.present?
    assert orphan.errors.invalid?(:sections)
    orphan.sections << sections(:home)
    orphan.save
    assert !orphan.errors.invalid?(:sections)
  end

  test "must have a title and body" do
    empty = Content.new
    assert !empty.valid?
    assert empty.errors.present?
    assert empty.errors.invalid?(:title)
    assert empty.errors.invalid?(:body)
    empty.title = 'test'
    empty.body = 'text'
    empty.save
    assert !empty.errors.invalid?(:title)
    assert !empty.errors.invalid?(:body)
  end

  test "can belong to many sections" do
    sections(:home).contents << contents(:one)
    sections(:home).save
    sections(:about).contents << contents(:one)
    sections(:about).save
    assert contents(:one).sections.present?
    assert contents(:one).sections.count == 2
  end
end
