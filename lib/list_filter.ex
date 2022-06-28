defmodule ListFilter do
  def call(list) do
    intList = filterInt(list)
    oddList = filterOdd(intList)

    Enum.count(oddList)
  end

  defp filterInt(list) do
    Enum.flat_map(list, fn item ->
      case Integer.parse(item) do
        # transform to integer
        {int, _rest} -> [int]
        # skip the value
        :error -> []
      end
    end)
  end

  defp filterOdd(list) do
    Enum.filter(list, fn item -> rem(item, 2) == 1 end)
  end
end
