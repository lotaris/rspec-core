Feature: implicit subject

  If the first argument to the outermost example group is a class, an
  instance of that class is made available to each example as the
  implicit subject of that example.

  Scenario: subject in top level group
    Given a file named "top_level_subject_spec.rb" with:
      """
      describe Array, "when first created" do
        it "should be empty" do
          subject.should eq([])
        end
      end
      """
    When I run "rspec ./top_level_subject_spec.rb"
    Then the output should contain "1 example, 0 failures"

  Scenario: subject in a nested group
    Given a file named "nested_subject_spec.rb" with:
      """
      describe Array do
        describe "when first created" do
          it "should be empty" do
            subject.should eq([])
          end
        end
      end
      """
    When I run "rspec nested_subject_spec.rb"
    Then the output should contain "1 example, 0 failures"
