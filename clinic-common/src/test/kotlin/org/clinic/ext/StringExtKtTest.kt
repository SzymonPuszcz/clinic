package org.clinic.ext

import io.kotest.assertions.throwables.shouldThrow
import io.kotest.core.spec.style.StringSpec
import io.kotest.data.forAll
import io.kotest.data.headers
import io.kotest.data.row
import io.kotest.data.table
import io.kotest.matchers.shouldBe
import org.clinic.exception.IllegalUUIDValue
import java.util.UUID

class StringExtKtTest : StringSpec({
    "Should map UUID String to UUID object correctly" {
        forAll(
            table(
                headers("uuidString", "expectedMostSigBits", "expectedLeastSigBits"),
                row("b629937e-8a54-4cd9-9fc2-d7a377981487", -5320559313065587495L, -6934743379111046009L),
                row("91171327-b2b7-4c1b-878f-b65db3d6be7a", -7991897952522646501L, -8678517443354247558L),
                row("d6b02f6b-53c1-449e-a0cb-b1bd1d17cd7d", -2976827215678716770L, -6860194181573784195L),
                row("f5997327-6f30-4e23-b7ec-016763d455d2", -749441249774121437L, -5193774726696905262L)
            )
        ) { uuidString, expectedMostSigBits, expectedLeastSigBits ->
            val uuid = uuidString.toUUID()

            val expected = UUID(expectedMostSigBits, expectedLeastSigBits)
            uuid shouldBe expected
        }
    }

    "Should throw IllegalUUUIDValue when map incorrect UUID String" {
        forAll(
            table(
                headers("uuidString"),
                row("f5997327_6f30_4e23_b7ec_016763d455d2"),
                row("f5997327-6f30-4e23-016763d455d2"),
                row("smaple text"),
                row(""),
            )
        ) {
            shouldThrow<IllegalUUIDValue> {
                it.toUUID()
            }
        }
    }
})
