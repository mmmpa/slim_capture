class TreeController < ApplicationController
  def index
@tree =
  {
    title: :a,
    children: [
      {
        title: :a_a
      },
      {
        title: :a_c,
        children: [
          {
            title: :a_c_a
          },
          {
            title: :a_c_b,
            children: [
              {
                title: :a_c_b_a
              }
            ]
          },
          {
            title: :a_c_c
          }
        ]
      },
      {
        title: :a_a
      }
    ]
  }
  end
end
