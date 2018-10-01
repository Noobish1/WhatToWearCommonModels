import Quick
import Nimble
import UIKit
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class WindDirectionSpec: QuickSpec {
    internal override func spec() {
        describe("WindDirection") {
            describe("its init with windBearing") {
                context("when the windBearing is nil") {
                    it("should return nil") {
                        expect(WindDirection(windBearing: nil)).to(beNil())
                    }
                }
                
                context("when the windBearing is not nil") {
                    context("when the windBearing is") {
                        var direction: WindDirection!
                        
                        context("not between 0 and 360") {
                            it("should return nil") {
                                expect(WindDirection(windBearing: 400)).to(beNil())
                            }
                        }
                        
                        context("between 337.5 and 360 and 0 and 22.5") {
                            var otherDirection: WindDirection!
                            
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 337.5...360)
                                )
                                otherDirection = WindDirection(
                                    windBearing: Double.random(in: 0...22.5)
                                )
                            }
                            
                            it("should return north") {
                                expect(direction) == .north
                                expect(otherDirection) == .north
                            }
                        }
                        
                        context("between 22.5 and 67.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 22.5...67.5)
                                )
                            }
                            
                            it("should return north east") {
                                expect(direction) == .northEast
                            }
                        }
                        
                        context("between 67.5 and 112.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 67.5...112.5)
                                )
                            }
                            
                            it("should return east") {
                                expect(direction) == .east
                            }
                        }
                        
                        context("between 112.5 and 157.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 112.5...157.5)
                                )
                            }
                            
                            it("should return south east") {
                                expect(direction) == .southEast
                            }
                        }
                        
                        context("between 157.5 and 202.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 157.5...202.5)
                                )
                            }
                            
                            it("should return south") {
                                expect(direction) == .south
                            }
                        }
                        
                        context("between 202.5 and 247.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 202.5...247.5)
                                )
                            }
                            
                            it("should return south west") {
                                expect(direction) == .southWest
                            }
                        }
                        
                        context("between 247.5 and 292.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 247.5...292.5)
                                )
                            }
                            
                            it("should return west") {
                                expect(direction) == .west
                            }
                        }
                        
                        context("between 292.5 and 337.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: Double.random(in: 292.5...337.5)
                                )
                            }
                            
                            it("should return north west") {
                                expect(direction) == .northWest
                            }
                        }
                    }
                }
            }
            
            describe("its allDirections") {
                var expectedArray: NonEmptyArray<WindDirection>!
                
                beforeEach {
                    expectedArray = NonEmptyArray(elements: .north, .south, .east, .west, .northEast, .northWest, .southEast, .southWest)
                }
                
                it("should return a nonemptyarray of all the directions") {
                    expect(WindDirection.allDirections) == expectedArray
                }
            }

            context("when it is north") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .north
                }
                
                describe("its arrowString") {
                    it("should return a up arrow") {
                        expect(direction.arrowString) == "↑"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be North") {
                        expect(direction.stringRepresentation) == NSLocalizedString("North", comment: "")
                    }
                }
            }
            
            context("when south") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .south
                }
                
                describe("its arrowString") {
                    it("should return a down arrow") {
                        expect(direction.arrowString) == "↓"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be South") {
                        expect(direction.stringRepresentation) == NSLocalizedString("South", comment: "")
                    }
                }
            }
            
            context("when east") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .east
                }
                
                describe("its arrowString") {
                    it("should return a right pointing arrow") {
                        expect(direction.arrowString) == "→"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be East") {
                        expect(direction.stringRepresentation) == NSLocalizedString("East", comment: "")
                    }
                }
            }
            
            context("when west") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .west
                }
                
                describe("its arrowString") {
                    it("should return a left pointing arrow") {
                        expect(direction.arrowString) == "←"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be West") {
                        expect(direction.stringRepresentation) == NSLocalizedString("West", comment: "")
                    }
                }
            }
            
            context("when north east") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .northEast
                }
                
                describe("its arrowString") {
                    it("should return a diagonal top right pointing arrow") {
                        expect(direction.arrowString) == "↗"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be North East") {
                        expect(direction.stringRepresentation) == NSLocalizedString("North East", comment: "")
                    }
                }
            }
            
            context("when north west") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .northWest
                }
                
                describe("its arrowString") {
                    it("should return a diagonal top left pointing arrow") {
                        expect(direction.arrowString) == "↖"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be North West") {
                        expect(direction.stringRepresentation) == NSLocalizedString("North West", comment: "")
                    }
                }
            }
            
            context("when south east") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .southEast
                }
                
                describe("its arrowString") {
                    it("should return a diagonal bottom right pointing arrow") {
                        expect(direction.arrowString) == "↘"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be South East") {
                        expect(direction.stringRepresentation) == NSLocalizedString("South East", comment: "")
                    }
                }
            }

            context("when south west") {
                var direction: WindDirection!
                
                beforeEach {
                    direction = .southWest
                }
                
                describe("its arrowString") {
                    it("should return a diagonal bottom left pointing arrow") {
                        expect(direction.arrowString) == "↙"
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be South West") {
                        expect(direction.stringRepresentation) == NSLocalizedString("South West", comment: "")
                    }
                }
            }
        }
    }
}
