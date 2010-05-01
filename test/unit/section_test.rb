require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "can create root section with no parent" do
    section = Section.create(:name => sections(:home).name)
    assert section.parent.nil?
  end

  test "can create child section belonging to parent" do
    name = 'Experience'
    experience = Section.create(:name => name,
                                :parent => sections(:about))
    assert experience.parent.present?
    assert sections(:about).children.count > 0
    assert sections(:about).children.first == experience
    assert sections(:about).children.first.name == name
  end

  test "cannot create section without name" do
    unknown = Section.new
    assert !unknown.valid?
    assert unknown.errors.present?
    assert unknown.errors.invalid?(:name)
    assert_equal "can't be blank", unknown.errors.on(:name)
  end

  test "cannot create section with duplicate name" do
    duplicate = Section.new(:name => sections(:home).name)
    assert !duplicate.valid?
    assert duplicate.errors.present?
    assert duplicate.errors.invalid?(:name)
    assert_equal 'has already been taken', duplicate.errors.on(:name)    
  end

  test "can contain many contents" do
    sections(:home).contents << contents(:one)
    sections(:home).contents << contents(:two)
    assert sections(:home).valid?
    sections(:home).save
    assert sections(:home).contents.present?
    assert sections(:home).contents.count == 2
  end
end
