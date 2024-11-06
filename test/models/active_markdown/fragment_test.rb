require "test_helper"

module ActiveMarkdown
  class FragmentTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    test "return empty paragraph for empty content" do
      assert_match /<p .*><\/p>/, active_markdown_fragments(:blank).render 
    end

    test "return empty paragraph for nil content" do
      assert_match /<p .*><\/p>/, active_markdown_fragments(:no_content).render 
    end

    test "return paragraph with content" do
      assert_match /<p .*>active markdown<\/p>/, active_markdown_fragments(:paragraph).render 
    end

    test "return paragraph when element is nil" do
      assert_match /<p .*>active markdown<\/p>/, active_markdown_fragments(:no_element).render 
    end

    test "return h1 header" do
      assert_match /<h1 .*>active markdown<\/h1>/, active_markdown_fragments(:h1_header).render 
    end

    test "return h2 header" do
      assert_match /<h2 .*>active markdown<\/h2>/, active_markdown_fragments(:h2_header).render 
    end

    test "return h3 header" do
      assert_match /<h3 .*>active markdown<\/h3>/, active_markdown_fragments(:h3_header).render 
    end
  end
end
