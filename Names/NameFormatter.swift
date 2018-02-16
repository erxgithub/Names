// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

class NameFormatter {
  
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  func inverted() -> String {
    let nameString = name.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if nameString == "" || nameString.range(of: String(",")) != nil{
      return ""
    }
 
    var invertedName = ""

    let components = nameString.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
    let words = components.filter { !$0.isEmpty }

    let prefixes = ["Mr.", "Mrs.", "Ms.", "Dr."]
    
    if prefixes.contains(words[0]){
      if words.count == 2 {
        invertedName = "\(words[0]) \(words[1])"
      } else if words.count == 3 {
        invertedName = "\(words[0]) \(words[2]), \(words[1])"
      }
    } else {
      if words.count == 1 {
        invertedName = words[0]
      } else {
        invertedName = "\(words[1]), \(words[0])"
      }
    }
    
    return invertedName
  }
  
}
