defmodule BinarySearch do
  @moduledoc """
  Implement a binary search algorithm.
  """

  @spec _search( list() , integer() , integer() , integer() ) :: { :ok, integer() } | :not_found
  @spec mid_idx( integer(), integer() ) :: integer()
  @spec search( tuple , integer ) :: { :ok , integer } | :not_found


  defp mid_idx( min , max ), do:
    min
    |> Kernel.+( 1 )
    |> Kernel.-( 1 )
    |> Kernel.+( max )
    |> Kernel.div( 2 )
    |> Kernel.round()


  # @spec _search( list() , integer() , integer() , integer() ) :: { :ok, integer() } | :not_found
  # defp _search( numbers , key , min , max ) when max - min == 1 do
  #   idx = mid_idx min , max

  #   cond do
  #     numbers |> Enum.at( idx ) === key ->
  #       { :ok , idx }

  #     true ->
  #       :not_found
  #   end
  # end


  defp _search numbers , key , min , max do
    idx = mid_idx min , max
    el  = numbers |> Enum.at( idx )

    cond do
      el === key ->
        { :ok , idx }

      key > el ->
        numbers |> _search( key , idx , max )

      key < el ->
        numbers |> _search( key , 0 , idx )
    end
  end


  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  def search( numbers , _key ) when numbers === {} do
    :not_found
  end

  def search numbers , key do
    numbers_list =
      numbers
      |> Tuple.to_list

    numbers_list
    |> _search( key, 0, numbers_list |> Kernel.length )
  end
end
