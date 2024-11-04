require "test_helper"

module ActiveMarkdown
  class FragmentTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    test "return empty paragraph for empty content" do
      assert_equal "<p></p>", active_markdown_fragments(:blank).render 

    end
  end
end
