"""Provides the repo macro to import ml_dtypes.

ml_dtypes provides machine-learning-specific data-types like bfloat16,
float8 varieties, and int4.
"""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    ML_DTYPES_COMMIT = "780b6d0ee01ffbfac45f7ec5418bc08f2b166483"
    ML_DTYPES_SHA256 = "b9af15a8c781fe5906bceb1b2ead8190bb02d7df4d96b98daa8242da40808ff1"
    tf_http_archive(
        name = "ml_dtypes",
        build_file = "//third_party/py/ml_dtypes:ml_dtypes.BUILD",
        link_files = {
            "//third_party/py/ml_dtypes:ml_dtypes.tests.BUILD": "tests/BUILD.bazel",
            "//third_party/py/ml_dtypes:LICENSE": "LICENSE",
        },
        sha256 = ML_DTYPES_SHA256,
        strip_prefix = "ml_dtypes-{commit}/ml_dtypes".format(commit = ML_DTYPES_COMMIT),
        urls = tf_mirror_urls("https://github.com/jax-ml/ml_dtypes/archive/{commit}/ml_dtypes-{commit}.tar.gz".format(commit = ML_DTYPES_COMMIT)),
    )
