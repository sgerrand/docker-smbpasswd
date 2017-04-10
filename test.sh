#!/bin/sh
set -e

increment_test_failures() {
    test -z "$TEST_FAILURES" && TEST_FAILURES=0
    TEST_FAILURES=$(echo $(( $TEST_FAILURES + 1 )))
}

docker build --tag test --quiet .

set +e

TEST_STRING="Test username is a required input"
if test "$(docker run -i test)" != "Username is required"; then
    echo "$TEST_STRING failed" >&2
    increment_test_failures
else
    echo "$TEST_STRING passed"
fi

TEST_STRING="Test domain is a required input"
if test "$(docker run -i test username)" != "Domain is required"; then
    echo "$TEST_STRING failed" >&2
    increment_test_failures
else
    echo "$TEST_STRING passed"
fi

set -e

test -z "$TEST_FAILURES" \
    && echo "All tests passed!" \
    || echo "Some tests failed." >&2
