defmodule SandboxWeb.StreamTestLive.Index do
  use SandboxWeb, :live_view

  alias Sandbox.StreamTests
  alias Sandbox.StreamTests.StreamTest

  def mount(_params, _session, socket) do
    socket =
      socket
      |> stream(:streamtests, StreamTests.list_stream_tests())

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div
      class="list-stream-tests"
      id="stream-tests"
      phx-update="stream"
      style="display: flex; flex-direction: column-reverse;"
    >
      <.stream_test_details
        :for={{dom_id, streamtest} <- @streams.streamtests}
        streamtest={streamtest}
        dom_id={dom_id}
      />
    </div>
    """
  end

  def stream_test_details(assigns) do
    ~H"""
    <div class="detail" phx-click="change" id={@dom_id} phx-value-id={@streamtest.id}>
      {@streamtest.id} - {@streamtest.detail}
    </div>
    """
  end

  def handle_event("change", %{"id" => id}, socket) do
    IO.puts("User clicked on #{id}")

    # Hardcoding a known StreamTest id
    socket =
      socket
      |> stream_insert(
        :streamtests,
        %StreamTest{
          id: id,
          detail: "This should replace the second element?"
        },
        at: :prepend
      )

    {:noreply, socket}
  end
end
