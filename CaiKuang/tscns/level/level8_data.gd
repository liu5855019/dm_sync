static func get_data() -> Dictionary:
    return {
        0: [
            StoneData.new(Vector2i(0, 0)),
            StoneData.new(Vector2i(2, 0)),
            OreData.new(7, Vector2i(3, 0)),
            OreData.new(8, Vector2i(4, 0)),
            OreData.new(9, Vector2i(5, 0))
        ],
        1: [
            StoneData.new(Vector2i(2, 1)),
            OreData.new(9, Vector2i(3, 1)),
            OreData.new(3, Vector2i(5, 1)),
            OreData.new(8, Vector2i(7, 1))
        ],
        2: [
            StoneData.new(Vector2i(0, 2)),
            OreData.new(7, Vector2i(2, 2)),
            OreData.new(4, Vector2i(4, 2)),
            OreData.new(2, Vector2i(5, 2)),
            StoneData.new(Vector2i(6, 2)),
            OreData.new(3, Vector2i(7, 2))
        ],
        3: [
            OreData.new(8, Vector2i(0, 3)),
            StoneData.new(Vector2i(1, 3)),
            OreData.new(8, Vector2i(2, 3)),
            OreData.new(6, Vector2i(3, 3)),
            OreData.new(4, Vector2i(4, 3)),
            OreData.new(9, Vector2i(5, 3)),
            OreData.new(8, Vector2i(6, 3)),
            StoneData.new(Vector2i(7, 3))
        ],
        4: [
            OreData.new(5, Vector2i(1, 4)),
            StoneData.new(Vector2i(2, 4)),
            StoneData.new(Vector2i(3, 4)),
            OreData.new(3, Vector2i(5, 4)),
            OreData.new(2, Vector2i(6, 4))
        ],
        5: [
            OreData.new(3, Vector2i(0, 5)),
            StoneData.new(Vector2i(2, 5)),
            StoneData.new(Vector2i(3, 5)),
            OreData.new(8, Vector2i(5, 5)),
            OreData.new(7, Vector2i(6, 5)),
            OreData.new(6, Vector2i(7, 5))
        ],
        6: [
            OreData.new(1, Vector2i(1, 6)),
            OreData.new(6, Vector2i(2, 6)),
            OreData.new(9, Vector2i(4, 6)),
            OreData.new(4, Vector2i(5, 6)),
            OreData.new(8, Vector2i(6, 6))
        ],
        7: [
            OreData.new(6, Vector2i(0, 7)),
            OreData.new(8, Vector2i(1, 7)),
            OreData.new(1, Vector2i(4, 7)),
            StoneData.new(Vector2i(5, 7)),
            StoneData.new(Vector2i(6, 7)),
            StoneData.new(Vector2i(7, 7))
        ],
        8: [
            StoneData.new(Vector2i(1, 8)),
            OreData.new(7, Vector2i(4, 8)),
            StoneData.new(Vector2i(5, 8)),
            StoneData.new(Vector2i(6, 8))
        ],
        9: [
            OreData.new(7, Vector2i(2, 9)),
            OreData.new(4, Vector2i(4, 9)),
            OreData.new(5, Vector2i(5, 9)),
            OreData.new(9, Vector2i(6, 9))
        ]
    }
