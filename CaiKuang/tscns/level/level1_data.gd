static func get_data() -> Dictionary:
    return {
        0: [
            OreData.new(1, Vector2i(0, 0)),
            OreData.new(2, Vector2i(1, 0)),
            OreData.new(1, Vector2i(3, 0)),
            StoneData.new(Vector2i(5, 0)),
            OreData.new(3, Vector2i(6, 0))
        ],
        1: [
            OreData.new(3, Vector2i(1, 1))
        ],
        2: [
            OreData.new(2, Vector2i(2, 2)),
            OreData.new(3, Vector2i(3, 2)),
            OreData.new(2, Vector2i(6, 2))
        ],
        4: [
            StoneData.new(Vector2i(0, 4)),
            OreData.new(2, Vector2i(1, 4)),
            OreData.new(2, Vector2i(2, 4)),
            OreData.new(2, Vector2i(3, 4)),
            OreData.new(2, Vector2i(4, 4)),
            OreData.new(2, Vector2i(5, 4)),
            OreData.new(1, Vector2i(6, 4))
        ],
        5: [
            OreData.new(1, Vector2i(7, 5))
        ],
        6: [
            StoneData.new(Vector2i(0, 6)),
            OreData.new(3, Vector2i(1, 6)),
            OreData.new(1, Vector2i(4, 6)),
            OreData.new(2, Vector2i(5, 6)),
            OreData.new(3, Vector2i(7, 6))
        ],
        7: [
            OreData.new(3, Vector2i(0, 7)),
            OreData.new(2, Vector2i(4, 7)),
            OreData.new(2, Vector2i(6, 7))
        ],
        8: [
            OreData.new(2, Vector2i(0, 8)),
            OreData.new(1, Vector2i(7, 8))
        ],
        9: [
            OreData.new(2, Vector2i(0, 9)),
            OreData.new(1, Vector2i(2, 9))
        ]
    }
