defmodule Sandbox.StreamTests do
  alias Sandbox.StreamTests.StreamTest

  def list_stream_tests do
    [
      %StreamTest{
        id: 1,
        detail: "This is the first stream test element"
      },
      %StreamTest{
        id: 2,
        detail:
          "This is the second stream test element.  I expect to be udpated when someone clicks on any of the items."
      },
      %StreamTest{
        id: 3,
        detail: "And for good measure, here's a third stream test element"
      }
    ]
  end
end
