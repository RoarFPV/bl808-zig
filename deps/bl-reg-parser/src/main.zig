const std = @import("std");
const bouffalo = @import("bouffalo");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const bftype = @TypeOf(bouffalo);
    const bf = @typeInfo(bftype);
    _ = bf;

    const decls = switch (@typeInfo(bouffalo)) {
        .Struct => |info| info.decls,
        .Enum => |info| info.decls,
        .Union => |info| info.decls,
        .Opaque => |info| info.decls,
        else => @compileError("Expected struct, enum, union, or opaque type, found '" ++ @typeName(bouffalo) ++ "'"),
    };

    const ts: []const std.builtin.Type = undefined;

    comptime {
        @setEvalBranchQuota(1_000_000);
        var array: [decls.len]std.builtin.Type = undefined;
        for (decls, 0..) |decl, i| {
            switch (@typeInfo(@TypeOf(@field(bouffalo, decl.name)))) {
                .Opaque => continue,
                else => |info| array[i] = info,
            }
        }

        ts = &array;
    }
    for (ts) |decl| {
        switch (decl) {
            .Struct => |info| std.debug.print("{s} : \n", .{info}),
        }

        // const ft = @typeName(decl.);
        // std.debug.print("{s} : \n", .{ft});
    }
    // }

    for (decls) |decl| {
        std.debug.print("{s} : \n", .{decl.name});
    }

    // comptime {
    //     for (std.meta.declarations(bouffalo)) |decl| {
    //         const f = @field(bouffalo, decl.name);
    //         std.debug.print("{s} : {s}\n", .{ decl.name, @typeName(@TypeOf(f)) });
    //     }
    // }
    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
