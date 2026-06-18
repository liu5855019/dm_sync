static func get_data() -> Dictionary:
    return {
        0: [
            OreData.new(3, Vector2i(0, 0)),
            OreData.new(6, Vector2i(3, 0))
        ],
        1: [
            OreData.new(6, Vector2i(0, 1)),
            StoneData.new(Vector2i(3, 1))
        ],
        2: [
            OreData.new(3, Vector2i(3, 2)),
            StoneData.new(Vector2i(7, 2))
        ],
        3: [
            OreData.new(6, Vector2i(3, 3)),
            OreData.new(4, Vector2i(5, 3)),
            StoneData.new(Vector2i(6, 3)),
            StoneData.new(Vector2i(7, 3))
        ],
        4: [
            StoneData.new(Vector2i(3, 4)),
            OreData.new(2, Vector2i(5, 4))
        ],
        5: [
            OreData.new(1, Vector2i(3, 5)),
            OreData.new(5, Vector2i(4, 5)),
            OreData.new(3, Vector2i(5, 5)),
            OreData.new(5, Vector2i(6, 5)),
            OreData.new(5, Vector2i(7, 5))
        ],
        6: [
            OreData.new(5, Vector2i(3, 6)),
            OreData.new(2, Vector2i(5, 6)),
            OreData.new(7, Vector2i(7, 6))
        ],
        7: [
            OreData.new(7, Vector2i(3, 7)),
            OreData.new(3, Vector2i(4, 7)),
            OreData.new(7, Vector2i(5, 7))
        ],
        8: [
            OreData.new(5, Vector2i(3, 8)),
            StoneData.new(Vector2i(4, 8))
        ],
        9: [
            OreData.new(4, Vector2i(1, 9)),
            OreData.new(5, Vector2i(3, 9)),
            StoneData.new(Vector2i(4, 9))
        ]
    }
