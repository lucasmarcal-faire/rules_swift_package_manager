"""Specifies the workspace dependencies for the `swift_bazel` repository."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=unnamed-macro
def swift_bazel_dependencies():
    """Declare the Bazel workspace dependencies for the `swift_bazel` repository."""

    # 2022-11-08: Retrieving the source archive so that I can use the gazelle
    # plugin. Work is happening to include it in the distribution.
    # https://github.com/bazelbuild/bazel-skylib/pull/400
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 =
            "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
        strip_prefix = "bazel-skylib-1.3.0",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/archive/1.3.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "56d8c5a5c91e1af73eca71a6fab2ced959b67c86d12ba37feedb0a2dfea441a6",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip",
        ],
    )

    # Post v0.28.0: Contains fix for passing test args to gazelle_generation_test.
    maybe(
        http_archive,
        name = "bazel_gazelle",
        sha256 = "6ad7e61c11901ba93485719939e6532e49ffc29434667585125ae6c633f8331c",
        strip_prefix = "bazel-gazelle-350e975e8999b784c6381d162b54252a7aa9cc4b",
        urls = [
            "https://github.com/bazelbuild/bazel-gazelle/archive/350e975e8999b784c6381d162b54252a7aa9cc4b.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "3f04ca2e3bef99563c6d96728b0a09f8484bc3c61ca804d29f67e86e6043c038",
        strip_prefix = "bazel-starlib-0.11.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.11.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "84e2cc1c9e3593ae2c0aa4c773bceeb63c2d04c02a74a6e30c1961684d235593",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.5.1/rules_swift.1.5.1.tar.gz",
    )
