static func get_data() -> Dictionary:
    return {
        0: [
            OreData.new(1, Vector2i(2, 0)),
            OreData.new(2, Vector2i(3, 0))
        ],
        1: [
            OreData.new(2, Vector2i(0, 1)),
            OreData.new(2, Vector2i(3, 1))
        ],
        2: [
            OreData.new(3, Vector2i(0, 2)),
            OreData.new(2, Vector2i(2, 2)),
            StoneData.new(Vector2i(3, 2))
        ],
        3: [
            StoneData.new(Vector2i(2, 3)),
            OreData.new(1, Vector2i(3, 3))
        ],
        4: [
            OreData.new(3, Vector2i(0, 4)),
            StoneData.new(Vector2i(2, 4)),
            OreData.new(4, Vector2i(3, 4))
        ],
        5: [
            OreData.new(4, Vector2i(0, 5)),
            OreData.new(5, Vector2i(2, 5)),
            StoneData.new(Vector2i(3, 5))
        ],
        6: [
            OreData.new(2, Vector2i(0, 6)),
            OreData.new(4, Vector2i(2, 6)),
            OreData.new(1, Vector2i(3, 6))
        ],
        7: [
            OreData.new(4, Vector2i(2, 7))
        ],
        8: [
            OreData.new(4, Vector2i(0, 8)),
            OreData.new(4, Vector2i(2, 8)),
            StoneData.new(Vector2i(3, 8))
        ],
        9: [
            OreData.new(4, Vector2i(0, 9))
        ]
    }
