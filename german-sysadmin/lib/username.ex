defmodule Username do
  @spec fold_fn( char() , Charlist.t() ) :: Charlist.t()
  defp fold_fn char , acc do
    case char do
        char when char in ?a..?z or char === ?_ ->
          [ char | acc ]

        ?ä -> [ ?a | [ ?e | acc ] ]
        ?ö -> [ ?o | [ ?e | acc ] ]
        ?ü -> [ ?u | [ ?e | acc ] ]
        ?ß -> [ ?s | [ ?s | acc ] ]
        _  -> acc
      end
  end


  @spec sanitize( Charlist.t() ) :: Charlist.t()
  def sanitize( username ), do: username |> List.foldr( ~c"" , &fold_fn/2 )
end
